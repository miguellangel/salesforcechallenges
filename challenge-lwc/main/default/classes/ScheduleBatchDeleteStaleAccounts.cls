global class ScheduleBatchDeleteStaleAccounts implements Schedulable {
    global void execute(SchedulableContext SC) {
        BatchDeleteStaleAccounts sb = new BatchDeleteStaleAccounts();
    }
}