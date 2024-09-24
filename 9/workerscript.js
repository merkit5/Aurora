function fibonacci(n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

WorkerScript.onMessage = function(message) {
    var result = fibonacci(message.number);
    WorkerScript.sendMessage({ result: result });
}
