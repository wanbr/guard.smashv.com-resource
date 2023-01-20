local function validate_token()
    local promise = promise.new()

    PerformHttpRequest(Constants.API_BASE_URL .. '/tokens/verify', function(_, body, _)
        promise:resolve(json.decode(body))
    end, 'POST', json.encode({ token = Constants.TOKEN }),
        { ['Content-Type'] = 'application/json' })

    local data = Citizen.Await(promise)

    return data?.valid
end

local function bootstrap()
    local validated = validate_token()

    Functions.assert(not validated, 'SMASHV_GUARD_TOKEN is invalid')
end

Citizen.CreateThread(function()
    Functions.assert(not Constants.TOKEN, 'SMASHV_GUARD_TOKEN is not set')

    bootstrap()
end)
