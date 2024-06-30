#!/bin/bash

echo "-------------[image list]-------------"
echo $INPUT_IMAGES

docker login -u ${INPUT_USERNAME} -p ${INPUT_PASSWORD} ${INPUT_REGISTRY}

for line in $INPUT_IMAGES
do
    old_image=${line}
    img=${old_image#*/}
    new_image="${INPUT_REGISTRY}/${INPUT_NAMESPACE}/img"
    echo "-------------[docker pull ${old_image}]-------------"
    docker pull "${old_image}"
    echo "-------------[docker tag ${old_image} ${new_image}]-------------"
    docker tag "${old_image}" "${new_image}"
    echo "-------------[docker push ${new_image}]-------------"
    docker push "${new_image}"
done


