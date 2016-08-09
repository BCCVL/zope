node {
    // fetch source
    stage 'Checkout'

    checkout scm

    // build image
    stage 'Build'

    def imagename = 'hub.bccvl.org.au/zope/zope'
    def img = docker.build(imagename)

    // publish image to registry
    stage 'Publish'

    def imagetag = getBuildoutVersion('files/versions.cfg', 'Zope2')
    img.push(imagetag)

    slackSend color: 'good', message: "New Image ${imagename}:${imagetag}\n${env.JOB_URL}"
}

