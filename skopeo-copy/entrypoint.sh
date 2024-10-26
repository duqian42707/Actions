#!/bin/bash

echo "-------------[image list]-------------"
echo $INPUT_IMAGES

echo "-------------[skopeo login]-------------"
skopeo login -u ${INPUT_USERNAME} -p ${INPUT_PASSWORD} ${INPUT_REGISTRY}

REPOSITORY_NAMES=""
for line in $INPUT_IMAGES
do
    old_image=${line}
    img=${old_image#*/}
    new_image="${INPUT_REGISTRY}/${INPUT_NAMESPACE}/${img}"
    echo "-------------[old_image: ${old_image}]-------------"
    echo "-------------[new_image: ${new_image}]-------------"
    echo "-------------[skopeo copy --multi-arch all docker://${old_image} docker://${new_image}]-------------"
    REPOSITORY_NAMES="${REPOSITORY_NAMES},${img%:*}"
    skopeo copy --multi-arch all docker://$old_image docker://$new_image
done

REPOSITORY_NAMES=${REPOSITORY_NAMES:1}
echo "REPOSITORY_NAMES: $REPOSITORY_NAMES"
# 设置步骤的输出参数
#echo "{name}={value}" >> "$GITHUB_OUTPUT"
echo "REPOSITORY_NAMES=$REPOSITORY_NAMES" >> "$GITHUB_OUTPUT"
echo "REPOSITORY_NAMES=$REPOSITORY_NAMES" >> "$GITHUB_ENV"



