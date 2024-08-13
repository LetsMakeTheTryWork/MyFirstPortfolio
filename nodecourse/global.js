

console.log('global');


setTimeout(()=>
    console.log('in the timeout'), 3000);   


console.log('global');
setTimeout(() => console.log('in the timeout'), 1000);
