
 oc  login -u system:admin -n default
TOKEN=$(oc get secrets -o jsonpath='{range .items[?(@.metadata.annotations.kubernetes\.io/service-account\.name=="skopeo")]}{.metadata.annotations.openshift\.io/token-secret\.value}{end}')
REGISTRY="$(oc get route docker-registry -n default -o 'jsonpath={.spec.host}')"
for i in `cat eaa-image2-list.txt` ;do  sudo skopeo --debug --insecure-policy copy --src-tls-verify=false --src-creds mycomosi:mo-eaa-ecr --dest-tls-verify=false --dest-creds="skopeo:$TOKEN"  docker://docker.mycom-osi.com/eaa/$i docker://$REGISTRY/default/$i; done
