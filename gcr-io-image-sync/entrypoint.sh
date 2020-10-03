#!/bin/bash

echo "-------------[image list]-------------"
echo $INPUT_IMAGES

echo "${INPUT_PASSWORD}" | docker login -u ${INPUT_USERNAME} --password-stdin ${INPUT_REGISTRY}

for line in $INPUT_IMAGES
do
    old_image=${line}
    IFS='/'
    arr=(${line})
    length=(${#arr[*]})
    if [ $length -gt 2 ];then
      new_image="$INPUT_NAMESPACE/${arr[1]}.${arr[2]}"
    else
      new_image="$INPUT_NAMESPACE/${arr[1]}"
    fi
    echo "-------------[docker pull ${old_image}]-------------"
    docker pull ${old_image}
    echo "-------------[docker tag ${old_image} ${new_image}]-------------"
    docker tag ${old_image} ${new_image}
    echo "-------------[docker push ${new_image}]-------------"
    docker push ${new_image}
done


