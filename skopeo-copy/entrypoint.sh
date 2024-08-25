#!/bin/bash

echo "-------------[image list]-------------"
echo $INPUT_IMAGES

echo "-------------[skopeo login]-------------"
skopeo login -u ${INPUT_USERNAME} -p ${INPUT_PASSWORD} ${INPUT_REGISTRY}

for line in $INPUT_IMAGES
do
    old_image=${line}
    img=${old_image#*/}
    new_image="${INPUT_REGISTRY}/${INPUT_NAMESPACE}/${img}"
    echo "-------------[old_image: ${old_image}]-------------"
    echo "-------------[new_image: ${new_image}]-------------"
    echo "-------------[skopeo copy --multi-arch all docker://${old_image} docker://${new_image}]-------------"
    skopeo copy --multi-arch all docker://$old_image docker://$new_image
done





