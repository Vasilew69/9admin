//NOTE: Due to fxs's node, declaring ANY variable in this file will pollute
// the global scope, and it will NOT show in `Object.keys(global)`!
// Hence why I'm doing some data juggling and duplicated function calls.

//Check if running inside FXServer
try {
    if (!IsDuplicityVersion()) throw new Error();
} catch (error) {
    console.log('9Admin must be run inside FXServer in monitor mode!');
    process.exit();
}

//Checking monitor mode and starting
try {
    if (GetConvar('monitorMode', 'false') == 'true') {
        require('./core/index.js');
    } else if (GetConvar('nineadminServerMode', 'false') == 'true') {
        //Nothing, for now
    }
} catch (error) {
    //Prevent any async console.log messing with the output
    process.stdout.write([
        'e'.repeat(80),
        `Resource load error: ${error.message}`,
        error.stack.toString(),
        'e'.repeat(80),
        ''
    ].join('\n'));
}
