local TOKEN = GetConvar('SMASHV_GUARD_TOKEN', '')

if not TOKEN or TOKEN == '' then
    error('SMASHV_GUARD_TOKEN is not set')
    return
end

local function validate_token()
    local validated = false

    PerformHttpRequest('https://smashv-guard.herokuapp.com/validate', function(err, text, headers)
        print(err, text, headers)
    end, 'POST', json.encode({ token = TOKEN }), { ['Content-Type'] = 'application/json' })

    return validated
end

local function bootstrap()
    local validated = validate_token()

    if not validated then
        error('SMASHV_GUARD_TOKEN is invalid')
        return
    end
end

bootstrap()