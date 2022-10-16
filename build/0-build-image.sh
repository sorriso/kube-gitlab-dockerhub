start=`date +%s`

# Local .env
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

rm ./build.log

nerdctl -n k8s.io pull gitlab/gitlab-ce:${GITLAB_VERSION}

nerdctl build \
    --build-arg ARG_GITLAB_VERSION=${GITLAB_VERSION} \
   --no-cache \
   --namespace k8s.io \
   -t l_gitlab:latest . 2> ./build.log

end=`date +%s`

runtime=$((end-start))
runtimeh=$((runtime/60))
runtimes=$((runtime-runtimeh*60))

echo "Total runtime was : $runtimeh minutes $runtimes seconds"
echo "" >> ./build.log
echo "Total runtime was : $runtimeh minutes $runtimes seconds" >> ./build.log
echo ""
