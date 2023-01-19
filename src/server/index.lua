local TOKEN = GetConvar('SMASHV_GUARD_TOKEN', '')

if not TOKEN or TOKEN == '' then
    error('SMASHV_GUARD_TOKEN is not set')
    return
end