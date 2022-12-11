import { convars, txEnv } from '@core/globalData';
import got from 'got';

export default got.extend({
    timeout: 5000,
    headers: {
        'User-Agent': `9Admin ${txEnv.txAdminVersion}`,
    },
    localAddress: convars.forceInterface ? convars.forceInterface : undefined,
});
