# coding: utf-8
import os

from huaweicloudsdkcore.auth.credentials import BasicCredentials
from huaweicloudsdkswr.v2.region.swr_region import SwrRegion
from huaweicloudsdkcore.exceptions import exceptions
from huaweicloudsdkswr.v2 import *

if __name__ == "__main__":
    # The AK and SK used for authentication are hard-coded or stored in plaintext, which has great security risks. It is recommended that the AK and SK be stored in ciphertext in configuration files or environment variables and decrypted during use to ensure security.
    # In this example, AK and SK are stored in environment variables for authentication. Before running this example, set environment variables CLOUD_SDK_AK and CLOUD_SDK_SK in the local environment
    ak = os.getenv("HUAWEI_CLOUD_SDK_AK")
    sk = os.getenv("HUAWEI_CLOUD_SDK_SK")
    namespace = os.getenv("HUAWEI_CLOUD_SWR_NAMESPACE")
    repository = os.getenv("HUAWEI_CLOUD_SWR_REPOSITORY")
    repository = repository.replace("/", "$")

    credentials = BasicCredentials(ak, sk)

    client = SwrClient.new_builder() \
        .with_credentials(credentials) \
        .with_region(SwrRegion.CN_NORTH_4) \
        .build()

    try:
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
