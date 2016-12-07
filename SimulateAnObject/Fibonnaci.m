N=input('Pick a number\n');
fib=zeros(1,N);
fib(1)=1;
fib(2)=1;
k=3;
while k <= N
    fib(k)=fib(k-2)+fib(k-1);
    k=k+1;
end

fprintf('The Fibonacci sequence to %d terms is\n',N);
fprintf('%g ',fib);
fprintf('\n');
fprintf('The %d th Fibonacci term is %i\n', N, fib(N));



