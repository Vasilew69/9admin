export default {
    fxserverPath: 'D:\\testing\\fxserver.exe',
    debouncerInterval: 250,
    preReleaseExpirationDays: 21,
    nineadminArgs: [
        '+set', 'nineadminDevMode', 'true',
        '+set', 'nineadminVerbose', 'true',
        // '+set', 'nineadminPort', '40121',
        '+set', 'txBuildVersion', '9999',
        

        //FIXME: broken
        '+set', 'txDebugPlayerlistGenerator', 'true',
        // '+set', 'txDebugExternalSource', 'xxxxxxxx:30120',
    ],
    copy: [
        'README.md',
        'LICENSE',
        'docs/',
        'fxmanifest.lua',
        'entrypoint.js',
        'resource/',
        'web/',
    ],
}
