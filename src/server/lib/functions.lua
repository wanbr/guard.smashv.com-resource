Functions = {}

function Functions.assert(test, err)
    if not test then
        return Logger.error(err)
    end
end