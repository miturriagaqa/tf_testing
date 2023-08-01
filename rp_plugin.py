"""
Plugin to post CIT results to ReportPortal
"""
from common.methods import set_progress
from reportportal_client import RPClient
from reportportal_client.helpers import timestamp

RP_ENDPOINT = "https://saas.reportportal.io"
RP_PROJECT = "cloudbolt"
RP_TOKEN = "{{ rp_token }}"
CIT_NAME = "{{ cit_name }}"
URL_PREFIX = "{{ cit_prefix }}"

def run(job, *args, **kwargs):
    if job.parent_job and job.parent_job.type == job.type:
        # This is a subjob of the same type as its parent. That means it is a single test run
        # that was run by a larger CIT job or a test group. Do not notify in this case.
        return

    grouped_jobs = job.children_jobs.all()
    if not job_groups.exists() or not job_groups.first().children_jobs.exists():
        # This is not the top job of a 3-tier, grouped CIT job, so reporting on the grouped results would not make sense
        return
    
    rp_client = RPClient(endpoint=RP_ENDPOINT, project=RP_PROJECT, token=RP_TOKEN)
    rp_client.start()
    
    launch = rp_client.start_launch(name = f"ci_test_CMP-{CIT_NAME}",
                                    start_time = timestamp(),
                                    description = f"CIT Job: {job}")

    # Create a test item for each CIT
    for test_case in grouped_jobs:
        tc_item_id = rp_client.start_test_item(name=str(test_case),
                                               start_time=timestamp(),
                                               item_type="TEST")
        
        # Add the link to the job to each TC in ReportPortal
        log_msg = f"{URL_PREFIX}{test_case.get_absolute_url()}"
        rp_client.log(time=timestamp(),
                      message=log_msg,
                      level="INFO",
                      item_id=tc_item_id)
        
        tc_status = ""
        if test_case.status == "SUCCESS":
            tc_status = "PASSED"
        if test_case.status == "FAILED":
            tc_status = "FAILED"
                        
        set_progress(f"Sending results for {tc_item_id}")
        rp_client.finish_test_item(item_id=tc_item_id,
                                   end_time=timestamp(),
                                   status=tc_status)
    
    rp_client.finish_launch(end_time=timestamp())
    rp_client.terminate()

    return "SUCCESS", "Results Posted", ""