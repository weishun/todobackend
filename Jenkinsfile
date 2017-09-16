node {
    checkout scm

    try {
        stage ('Run unit/integration tests') {
            sh 'make test'
        }
        stage( 'Build application artefacts') {
            sh 'make build'
        }
        stage( 'Create release environment and run acceptance tests' ) {
            sh 'make release'
        }
        stage( 'Tag and publish relase image' ){
            sh "make tag latest \$(git rev-parse --short HEAD) \$(git tag --points-at HEAD)"
            sh "make buildtag master \$(git tag --points-at HEAD)"
            withEnv([ "DOCKER_USER=${DOCKER_USER}",
                    "DOCKER_PASSWORD=${DOCKER_PASSWORD}",
                    "DOCKER_EMAIL=${DOCKER_EMAIL}"]) {
                sh "make login"
            }
            sh "make publish"
        }

    }
    finally {
        stage ('Collect test reports') {
            step([$class: 'JUnitResultArchiver', testResults: '**/reports/*.xml'])
        }
        stage( 'Clean up') {
            sh 'make clean'
            sh 'make logout'
        }
    }
}