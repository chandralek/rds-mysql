pipeline{
  agent any

  parameters {
    choice(name: 'ACTION', choices: ['', 'APPLY', 'DESTROY'], description: 'Pick something')
  }

  environment {
            RDS = credentials('RDS-MYSQL-PASS-DEV')
          }


  stages{
    stage('Terramform init')
            {
              steps{
                sh '''
                  terraform get -update
                  terraform init
              '''
              }
            }
    stage('Terramform apply')
            {
              when{
                expression{
                  params.ACTION == 'APPLY'
                }
              }
              steps{
                sh '''
                  terraform apply -auto-approve -var DBUSER=${RDS_USR} -var DBPASS=${RDS_PSW}
              '''
              }
            }
    stage('Terramform destroy')
            {
              when{
                expression{
                  params.ACTION == 'DESTROY'
                }
              }
              steps{
                sh '''
                  terraform destroy -auto-approve -var DBUSER=${RDS_USR} -var DBPASS=${RDS_PSW}
              '''
              }
            }
  }
}