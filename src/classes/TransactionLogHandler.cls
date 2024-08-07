public class TransactionLogHandler {
    public static void doHandleException(System.Exception ex, String processName) {
        // Create an instance of the custom object Error_Log__c
        Error_Log__c transactionLog = new Error_Log__c();

        // Set the Log_Details__c field with the exception details
        transactionLog.Log_Details__c = ex.getStackTraceString() + '<br> <strong> Message is <strong> ' + ex.getMessage() + ' <br> ' + ex.getCause() + ' <br> ' + ex.getLineNumber();

        // Set the Log_Date_Time__c field with the current timestamp
        transactionLog.Log_Date_Time__c = System.Now();

        // Set the Process_Name__c field with the provided process name
        transactionLog.Process_Name__c = processName;

        // Check if the Error_Log__c object is createable (permissions check)
        if (Schema.sObjectType.Error_Log__c.isCreateable()) {
            // Insert the transaction log record
            insert transactionLog;
        }
    }
}