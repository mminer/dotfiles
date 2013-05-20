#!/usr/bin/env python
# -*- coding: utf-8 -*-
#==============================================================================
# Copyright 2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#       http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions
# and limitations under the License.
#==============================================================================
from lib.utility import misc
from scli.constants import CommandType, EbCliVersion, ParameterName


#----------------------------------------------
# Command line arguments
#----------------------------------------------

class EBSCliAttr(object):
    Name = 'AWS Elastic Beanstalk Command Line Interface ' + misc.to_unicode(EbCliVersion)
    Version = 'AWS Elastic Beanstalk Command Line Interface ' + misc.to_unicode(EbCliVersion)
    Usage = '%(prog)s {COMMAND} [options]'
    ErrorMsg ='Error: {0}\n{1}Try {2} --help for more information.\n'
    InvalidCommand = 'Invalid command: {0}'
    NotSupportedCommand = 'Not supported command: {0} {1}'

    
""" Define command line argument switch """
CLISwitch = {
    ParameterName.Command : 'command',
    ParameterName.SubCommand : 'sub-commands',
    ParameterName.AwsCredentialFile : 'aws-credential-file',
    ParameterName.AwsAccessKeyId :  'access-key-id',    
    ParameterName.AwsSecretAccessKey :  'secret-key',    
    ParameterName.Region :  'region',    
    ParameterName.ServiceEndpoint :  'url',    
    ParameterName.SolutionStack :  'solution-stack',    
    ParameterName.ApplicationName :  'application-name',    
    ParameterName.ApplicationVersionName :  'version-label',    
    ParameterName.EnvironmentName :  'environment-name',    
    ParameterName.WaitForFinishTimeout :  'polling-timeout',    
    ParameterName.Force : 'force',
    ParameterName.Verbose : 'verbose',
}


""" Define help message for each command line argument """
CLISwitchMsg = {
    ParameterName.Command : '',    
    ParameterName.AwsCredentialFile : 'File location where your AWS credentials ' \
        'are saved. Use the environment variable AWS_CREDENTIAL_FILE to set the ' \
        'file location.',
    ParameterName.AwsAccessKeyId :  'Your AWS Access Key ID.',    
    ParameterName.AwsSecretAccessKey :  'Your AWS Secret Key.',    
    ParameterName.Region : 'AWS Elastic Beanstalk region (i.e., us-east-1).',    
    ParameterName.ServiceEndpoint :  'AWS Elastic Beanstalk endpoint (i.e., ' \
        'elasticbeanstalk.us-east-1.amazonaws.com).',    
    ParameterName.SolutionStack :  'Solution stack used as an application ' \
        'container type.',    
    ParameterName.ApplicationName :  'The name of the application to deploy.',    
    ParameterName.ApplicationVersionName :  'The name of the application version ' \
        'to deploy.',    
    ParameterName.EnvironmentName : 'A unique name for the environment deployment. ' \
        'The environment name is used in the application URL.',    
    ParameterName.WaitForFinishTimeout :  'Number of seconds before a start or stop ' \
        'operation times out when polling for environment status. ' \
        'The default is {0} second.',            
    ParameterName.Force : 'Skip confirmation prompt.',
    ParameterName.Verbose : 'Display verbose information.',
}



#----------------------------------------------
# Terminals
#----------------------------------------------

class TerminalMessage(object):
    CurrentValue = ' (current value is "{0}")'
    AutoGeneratedValue = ' (auto-generated value is "{0}")'
    SingleChoice = 'Select'
    AvailableRegion =  'Available service regions are:'
    AvailableSolutionStack = 'Available solution stacks are:'
    
    ConfirmToProceed = 'Are you sure? [y/n]: '
    
    AWSKeyLocateHelp = 'To get your AWS Access Key ID and Secret Access Key, \n  visit ' \
        '"https://aws-portal.amazon.com/gp/aws/securityCredentials".'
    
    CopyDefaultToBranch = 'Do you want to copy the settings from environment "{0}" for the new branch? [y/n]: '
    NoBranchToRegister = "The branch doesn't exist."
    FallBackToDefaultBranch = 'The current branch "{0}" is not associated with an Elastic Beanstalk '\
                                 'environment. Call "eb branch" to set up a new environment for this branch. '\
                                 '\nProceeding with default settings.'

""" Define prompt message for terminal interface """
TerminalPromptAskingMessage = {
    ParameterName.AwsAccessKeyId :  'Enter your AWS Access Key ID{0}: ',    
    ParameterName.AwsSecretAccessKey :  'Enter your AWS Secret Access Key{0}: ',    
    ParameterName.Region :  'Select an AWS Elastic Beanstalk service region{0}.',    
    ParameterName.ServiceEndpoint :  'Enter AWS Elastic Beanstalk service endpoint{0}: ',    
    ParameterName.SolutionStack :  'Select a solution stack{0}.',    
    ParameterName.ApplicationName :  'Enter an AWS Elastic Beanstalk application name{0}: ',    
    ParameterName.ApplicationVersionName :  'Enter an AWS Elastic Beanstalk application version name{0}: ',    
    ParameterName.EnvironmentName :  'Enter an AWS Elastic Beanstalk environment name{0}: ',
    
    ParameterName.RdsEnabled : 'Create an RDS DB Instance? [y/n]{0}: ',
    ParameterName.RdsSourceSnapshotName : 'Enter your snapshot ID: ',
    ParameterName.RdsMasterPassword : 'Enter an RDS DB master password{0}: ',
    ParameterName.RdsDeletionPolicy: 'It you terminate your environment, your RDS DB '\
        'Instance will be deleted and you will loose your data.\nCreate snapshot? [y/n]{0}: ',
    ParameterName.InstanceProfileName: 'Enter the name or ARN of an existing instance profile: ',    
}


TerminalPromptSettingParameterMessage = {
    ParameterName.EnvironmentName : 'Using auto-generated AWS Elastic Beanstalk environment name: "{0}".',
    ParameterName.Region :  'Setting AWS Elastic Beanstalk region to "{0}".',
    ParameterName.ServiceEndpoint :  'Setting AWS Elastic Beanstalk service endpoint to "{0}".',
    ParameterName.RdsEndpoint :  'Setting AWS Relational Database Service endpoint to "{0}".',
    ParameterName.SolutionStack : 'Setting solution stack to "{0}".',
    ParameterName.RdsSnippetUrl : 'Setting RDS extension url to "{0}".',    
    ParameterName.CurrentBranch : 'The current branch is "{0}".',
}


TerminalPromptUsingParameterMessage = {
    ParameterName.AwsAccessKeyId :  'AWS Access Key ID: ***',    
    ParameterName.AwsSecretAccessKey :  'AWS Secret Access Key: ***',    
    ParameterName.Region :  'AWS Elastic Beanstalk service region: {0}.',    
    ParameterName.ServiceEndpoint :  'AWS Elastic Beanstalk service endpoint: {0}.',    
    ParameterName.SolutionStack :  'Solution stack {0}.',    
    ParameterName.ApplicationName :  'AWS Elastic Beanstalk application: {0}.',    
    ParameterName.ApplicationVersionName :  'AWS Elastic Beanstalk application version : {0}.',   
    ParameterName.EnvironmentName :  'AWS Elastic Beanstalk environment: {0}.',    
}


class RdsTerminalMessage(object):
    RdsSnapshotNameSelect = 'Create an RDS BD Instance from{0}:'
    NoSnapshot = '[No snapshot]'
    OtherSnapshot = '[Other snapshot]'
    
    PasswordConfirmation = 'Retype password to confirm: '
    PasswordNotMatch = 'Error: passwords do not match.'
    PasswordMatchFailure = 'Rerun "eb init" to set up configuration.'
    PasswordWrongFormat = 'Error: password must contain from 8 to 41 alphanumeric characters.'

class IamTerminalMessage(object):
    ProfileNameSelect = 'Attach an instance profile{0}:'
    CreateProfile = '[Create a default instance profile]'
    NoProfile = '[No instance profile]'
    OtherProfile = '[Other instance profile]'
    ProfileNotExist = 'Instance profile {0} does not exist.'
    AccessDeniedMessage = 'You IAM user does not have sufficient permission. {0}'
    ContinueWithoutRole = 'Do you want to proceed without attaching an instance profile? [y/n]: '
    
#----------------------------------------------
# Operation
#----------------------------------------------

class BaseOpMessage(object):
    WaitForEnv = 'Waiting for environment "{0}" to {1}.'
    EnvNotExist = 'Environment "{0}" does not exist.'
    Running = 'Running.'
    UserCanInterrupt = 'Press Ctrl+C to stop polling. The operation will continue on the server side.'


class CreateApplicationOpMessage(object):
    Start = 'Now creating application "{0}".'
    AlreadyExist = 'Starting application "{0}".'
    Succeed = 'Created application "{0}".'


class DeleteApplicationOpMessage(object):
    Start = 'Now deleting application "{0}".'
    AlreadyDelete = 'Application "{0}" has already been deleted.'
    Succeed = 'Deleted application "{0}".'


class DescribeEnvironmentOpMessage(object):
    Start = 'Retrieving status of environment "{0}".'
    NoEnvironment = 'Environment "{0}" is not running.'
    Result = 'URL\t: {0}\nStatus\t: {1}\nHealth\t: {2}'
    Detail = 'Environment Name:\t{0}\nEnvironment ID:\t\t{1}\nSolution Stack:\t\t{2}\n'\
        'Version Label:\t\t{3}\nDate Created:\t\t{4}\nDate Updated:\t\t{5}\nDescription:\t\t{6}'
    RdsInfo = '\nRDS Database: {0} | {1}:{2}'
    RdsDetail = 'Database Engine:\t{0}\nAllocated Storage:\t{1}\nInstance Class:\t\t{2}\n'\
        'Multi AZ:\t\t{3}\nMaster Username:\t{4}\nCreation Time:\t\t{5}\n'\
        'DB Instance Status:\t{6}'


class CreateEnvironmentOpMessage(object):
    Start = 'Now creating Environment "{0}".'
    AlreadyExist = 'Environment "{0}" already exists. Skipped creating.'
    UsingOptionSetting = 'Using option settings retrieved from file "{0}" to create environment.'
    Succeed = 'Started creating environment.'
    WaitAfterLaunch = 'Waiting for environment "{0}" to launch.'

    
class WaitForCreateEnvironmentFinishOpMessage(object):
    Action = 'launch'
    Succeed = 'Creation of environment "{0}" has completed.'
    Timeout = 'Timeout for waiting Environment {0} finishing launch.'
    Result = 'Application is available at "{0}".'

    
class TerminateEnvironmentOpMessage(object):
    Start = 'Now terminating environment "{0}".'
    Succeed = 'Stopping environment "{0}". This may take a few minutes.'    
    

class WaitForTerminateEnvironmentFinishOpMessage(object):
    Action = 'stop'
    Succeed = 'Stop of environment "{0}" has completed.' 
    Timeout = 'Timeout for waiting Environment "{0}" finishing termination.'
    Status = 'Environment Status is "{0}". Health is "{1}".'
    Result = 'Environment status is: "{0}".'


class UpdateEnvironmentOptionSettingOpMessage(object):
    Continue = 'Continue? [y/n]: '
    Start = 'Now updating environment "{0}"\'s option settings.'
    UsingOptionSetting = 'Using option settings retrieved from file "{0}" to update environment.'
    Succeed = 'Updating environment "{0}". This may take a few minutes.'    

class WaitForUpdateEnvOptionSettingFinishOpMessage(object):
    Action = 'updating'
    Succeed = 'Update of environment "{0}" has completed.' 
    Timeout = 'Timeout for waiting Environment "{0}" finishing update.'
    Result = 'Environment URL is "{0}", status is: "{1}", health is "{2}".'

class EnvRetrieveInfoOpMessage(object):
    Action = 'generating logs'
    Timeout = 'Timeout for waiting Environment "{0}" generating log.'
    FileOuputPrefix = '==================== {0} ===================='
    LineOuputMask = '[{0}] {1}'
    
    
class CreateApplicationVersionOpMessage(object):
    Start = 'Now creating application version "{0}" using the sample application.'
    AlreadyExist = 'Application version "{0}" already exists. Skipped creating.'
    HasDefaultAppSource = 'Specified solution stack "{0}" has default application.'
    CannotRecognize = 'Cannot infer sample app for solution stack "{0}".'
    Skip = 'Skipped creating sample application version.'
    Succeed = 'Created application version "{0}".'    

class PushApplicationVersionOpMessage(object):
    EnvNotExist = 'Environment {0} is not running.'

class RecordApplicationVersionOpMessage(object):
    Start = 'Recording application version of environment "{0}".'
    NotExist = 'Cannot find environment "{0}".'
    Succeed = 'Recorded application version "{0}".'  
    
class ListSolutionStackOpMessage(object):
    Start = 'Retrieving available solution stacks.'
    Result = 'Available solution stacks: "{0}"'

class SaveConfigurationSettingOpMessage(object):
    Start = 'Now retrieving options settings for environment "{0}".'
    Succeed = 'Saved option settings in "{0}"'
        
class WriteAwsCredentialFileOpMessage(object):
    Confirm = 'Confirm to create AWS Credential file "{0}"? [y/n]'
    Succeed = 'Updated AWS Credential file at "{0}".'    
            
class AskConfirmationOpMessage(object):
    CommandConfirmation ={
        CommandType.STOP : 'Terminate environment? [y/n]: ',
        CommandType.DELETE : 'Delete application? [y/n]: ',
        CommandType.UPDATE : 'Update environment? [y/n]: ',
    }    
    
    CommandWarning ={
        CommandType.STOP : 'If you terminate your environment, your RDS DB Instance will be'\
            ' deleted and you will lose your data.',
        CommandType.DELETE : 'If you delete your application, your RDS DB Instance will be'\
            ' deleted and you will lose your data.',
        CommandType.UPDATE : 'If you udpate your environment, your RDS DB Instance will be'\
            ' deleted and you will lose your data.',
    }

class GetEnvironmentEventsOpMessage():
    NotValidNumber = '"{0}" is not a valid number.'

        
#----------------------------------------------
# Validation
#----------------------------------------------


class ValidationMessage(object):
    EmptyString = "{0}'s value cannot be empty."
    InvalidNumber = 'Invalid number "{0}"'
    NumberTooBig = '{0} is bigger than allowed range'
    NumberTooSmall = '{0} is smaller than allowed range"'
    
    InvalidSolutionStack = 'Specified solution stack "{0}" is invalid.'
    InvalidRegion = 'Specified region "{0}" is invalid.'
    
    ValidateSettingError = '{0}: Namespace "{1}", Option name "{2}"\n    {3}'

    
#----------------------------------------------
# Configuration file
#----------------------------------------------

class GeneralFileMessage(object):
    RenameFile = 'Renamed file "{0}" to "{1}".'
    RotationNameNotAvailable = 'File {0} cannot be rotated because no rotation name is available.'


class CredentialFileMessage(object):
    CannotFind = 'The AWS credential file, "{0}", cannot be found. Use the "{1}" command to create it.'
    CorrectionSuggestion = 'The AWS credential, "{0}", could not be parsed. ' \
        'Delete the file, or try the {1} command to recreate.'    
            
class CredentialFileErrorMessage(object):
    ReadError = 'Encountered error while reading from file {0}.'   
    WriteError = 'Encountered error while writing file {0}.'


    
class ConfigFileMessage(object):
    CannotFind = 'The configuration file, "{0}", cannot be found. Use the "{1}" command to create it.'
    CorrectionSuggestion = 'The configuration file, "{0}", could not be parsed. '\
        'Delete the file, or try the "{1}" command to reconfigure.'    
    BranchResetWarning = 'Existing branches have been reset due to a change in the application name, '\
        'region, or solution stack.'
    
class ConfigFileErrorMessage(object):
    ReadError = 'Encountered error while reading from file {0}.'   
    WriteError = 'Encountered error while saving file {0}.'
    PermissionError = 'Warning. File "{0}" has incorrect access permission '\
         'and can be accessed by other users.'
    

class DevToolsMessage(object):
    GitCommandError = 'Unable to call Git. Install Git to deploy to Elastic Beanstalk. {0}'
    GitRepoNotExist = '{0}\nWarning: Your directory has not been initialized as a Git repository. '\
        'To create a local Git repository, run "git init" and then re-run the "eb init" command.'
    InitError = 'Failed to update local Git repository setting. {0}'
    ExecutionError = 'Failed to update local Git configuration. '\
        'Follow the instructions at "{0}" to set up your Git repository, and then try again.'
    FileMissingError = 'Cannot run AWS Dev Tools initialization script at "{0}".'    
    GitHeadNotExist = 'Unable to retrieve HEAD of local repository. {0}'    
    PushLocalHead = 'Would you like to deploy the latest Git commit to your environment? [y/n]: '
    PushFail = 'Cannot run aws.push for local repository HEAD: {0}'    
    
class OptionSettingFileMessage(object):
    CannotFind = 'The option setting file, "{0}", cannot be found. Use the "{1}" command to create it.'
    CorrectionSuggestion = 'The option setting, "{0}", could not be parsed. ' \
        'Delete the file, or try the {1} command to recreate.'    
    
class OptionSettingFileErrorMessage(object):
    ReadError = 'Encountered error while reading from file {0}.'   
    WriteError = 'Encountered error while saving file {0}.'
