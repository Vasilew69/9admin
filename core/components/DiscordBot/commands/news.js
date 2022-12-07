const modulename = 'DiscordBot:cmd:news';
import humanizeDuration from 'humanize-duration';
import { MessageEmbed } from '@citizenfx/discord.js';
import logger from '@core/extras/console.js';
import { txEnv } from '@core/globalData';
const { dir, log, logOk, logWarn, logError } = logger(modulename);

export default {
    description: 'Says the new updates on the server',
    cooldown: 1,
    async execute (message, args) {
        let replace = {};
        let cardColor, cardTitle;
        cardColor = 0x74EE15;
        cardTitle = 'News';
        let desc = globals.discordBot.config.news;
        Object.entries(replaces).forEach(([key, value]) => {
            desc = desc.replace(`<${key}>`, value);
        });
        const outMsg = new MessageEmbed({
            color: cardColor,
            title: cardTitle,
            description: desc,
            footer: `Powered by 9City v${txEnv.txAdminVersion}.`,
        });
        return await message.reply({embeds: [outMsg]});
    }
}