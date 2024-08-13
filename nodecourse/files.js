//Reading a file

const { Console } = require('console');
const fs=require('fs');

fs.readFile('./docs/blog1.txt', (err, data) => {
    if (err) {
        return console.error('Error reading the file:', err);
    }
    console.log(data.toString());
});

console.log('last line');




//Writing a file

