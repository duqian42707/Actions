# coding: utf-8
import os

from huaweicloudsdkcore.auth.credentials import BasicCredentials
from huaweicloudsdkswr.v2.region.swr_region import SwrRegion
from huaweicloudsdkcore.exceptions import exceptions
from huaweicloudsdkswr.v2 import *

ak = os.getenv("HUAWEI_CLOUD_SDK_AK")
sk = os.getenv("HUAWEI_CLOUD_SDK_SK")
region = os.getenv("HUAWEI_CLOUD_SWR_REGION")
namespace = os.getenv("HUAWEI_CLOUD_SWR_NAMESPACE")
repos = os.getenv("HUAWEI_CLOUD_SWR_REPOS")

def send_request(repository):
    try:
        repository = repository.replace("/", "$")
        request = UpdateRepoRequest(namespace, repository)
        request.body = UpdateRepoRequestBody(
            is_public=True
        )
        response = client.update_repo(request)
        print(response)
    except exceptions.ClientRequestException as e:
        print(e.status_code)
        print(e.request_id)
        print(e.error_code)
        print(e.error_msg)


if __name__ == "__main__":
    credentials = BasicCredentials(ak, sk)
    client = SwrClient.new_builder() \
        .with_credentials(credentials) \
        .with_region(SwrRegion.value_of(region)) \
        .build()
    strs = repos.split(',')
    for repo in strs:
        send_request(repository=repo)
