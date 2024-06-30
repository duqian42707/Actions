#!/bin/bash

echo "-------------[START]-------------"
echo $INPUT_REGISTRY_SECRET > /registry-secret.yaml
echo $INPUT_TRANSFER_RULE > /transfer-rule.yaml
/image-transfer --securityFile=./registry-secret.yaml --ruleFile=./transfer-rule.yaml



