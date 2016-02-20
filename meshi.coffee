cron = require("cron").CronJob;
google = require("googleapis").customsearch("v1")
random = require('hubot').Response::random

CX = process.env.HUBOT_GOOGLE_CSE_ID;
API_KEY = process.env.HUBOT_GOOGLE_CSE_KEY;
room_name = process.env.HUBOT_MESHITERO_CHANNEL;
module.exports = (robot) ->

    send = (msg, word) ->
        e = { room: "#{room_name}" }
        if msg?
            msg.reply word
        else
            robot.send e, word

    getmeshi = (msg, keyword, f) ->
        SEARCH = "飯テロ#{keyword}"
        google.cse.list {
            cx: CX,
            q: SEARCH,
            auth: API_KEY,
            searchType: "image",
            safe: "off"
        }, (err, resp) ->
            if err
                send msg, "Error"
                return

            max = if resp.items.length > 10 then 10 else resp.items.length
            f = if max < f then max else f
            log = []
            for i in [1 .. f]
                loop
                    url = resp.items[Math.floor(Math.random()*resp.items.length)].link
                    break unless url in log
            send msg, "#{url}"
            log.push(url)


    new cron '0 0 22 * * *', ->
        getmeshi(null, "", 1)
    , null, true

    robot.hear /(meshi|めし|メシ|飯)(テロ|てろ|tero)?( ([^\s0-9]*))?$/i, (msg) ->
        key = if !msg.match[3] then "" else " #{msg.match[3]}"
        getmeshi(msg, key, 1)

    robot.hear /(meshi|めし|メシ|飯)(テロ|てろ|tero)? ([0-9]*)$/i, (msg) ->
        getmeshi(msg, "", Number(msg.match[3]))

    robot.hear /(meshi|めし|メシ|飯)(テロ|てろ|tero)? ([^\s]*)? ([0-9]*)$/i, (msg) ->
        key = if !msg.match[3] then "" else "#{msg.match[3]}"
        f = Number(msg.match[4])
        getmeshi(msg, key, f)
