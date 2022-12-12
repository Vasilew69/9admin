const modulename = 'DiscordBot:cmd:nineadmin';
import { MessageEmbed } from '@citizenfx/discord.js';
import logger from '@core/extras/console.js';
import { txEnv } from '@core/globalData';
const { dir, log, logOk, logWarn, logError } = logger(modulename);

export default {
    description: 'Prints the current nineadmin version',
    async execute(message, args) {
        const outMsg = new MessageEmbed({
            color: 0x4DEEEA,
            title: `${globals.config.serverName} uses nineadmin v${txEnv.nineadminVersion} :smiley:`,
            description: 'Checkout the project:\n GitHub: https://github.com/tabarra/nineadmin\n Discord: https://discord.gg/f3TsfvD',
        });
        return await message.reply({embeds: [outMsg]});
    },
};
