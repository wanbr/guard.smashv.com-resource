Logger = {}

function Logger.debug(message, ...)
    if Constants.LOG_LEVEL <= 3 then return end

    print('^4' .. message:format(...) .. "^0")
end

function Logger.warn(message, ...)
    if Constants.LOG_LEVEL <= 1 then return end

    print('^3' .. message:format(...) .. "^0")
end

function Logger.error(message, ...)
    if Constants.LOG_LEVEL <= 0 then return end

    print('^1' .. message:format(...) .. "^0")
end
