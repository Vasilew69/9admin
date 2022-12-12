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
        let replaces = {};
        let cardColor, cardTitle;
        cardColor = 0x74EE15;
        cardTitle = 'News';
        replaces.update = '--';
        replaces.added = '--';
        replaces.removed = '--';

        let desc = globals.discordBot.config.newsMessage;
        Object.entries(replaces).forEach(([key, value]) => {
            desc = desc.replace(`<${key}>`, value);
        });

        let humanizeOptions = {
            language: globals.translator.t('$meta.humanizer_language'),
            round: true,
            units: ['d', 'h', 'm', 's'],
            fallbacks: ['en'],
        };

        const outMsg = new MessageEmbed({
            color: cardColor,
            title: cardTitle,
            description: desc,
            footer: `Powered by 9City v${txEnv.nineadminVersion}.`,
        });

        return await message.reply({embeds: [outMsg]});
    }
}