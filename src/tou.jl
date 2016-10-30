holidays = readcsv(Pkg.dir("SmartMeterAnalytics/data/holidays.csv"), Int)
holidays = Date[Date(holidays[i,1], holidays[i,2], holidays[i,3]) for i in 1:size(holidays, 1)]

"""Converts timestamp to Ontario-specific time-of-use category, with holidays defined for 2009-2015"""
#TODO: Generalize to other jurisdictions
tou(dt::TimeType) = if isnight(dt) || dayofweek(dt) > 5 || isholiday(dt) # Evening or Weekend or Holiday
    return :OffPeak
elseif 5 <= month(dt) <= 10 # Cooling season
    return ismidday(dt) ? :OnPeak : :MidPeak
else # Heating season
    return ismidday(dt) ? :MidPeak : :OnPeak
end #if

isholiday(dt::TimeType) = length(searchsorted(holidays, Date(DateTime(dt)))) > 0
isnight(dt::TimeType) = !(7 <= hour(dt) < 19)
ismidday(dt::TimeType) = 11 <= hour(dt) < 17

