using SmartMeterAnalytics
using Base.Test

@test tou(DateTime(2012, 10, 10, 12)) == :OnPeak # Cooling weekday on-peak
@test tou(DateTime(2012, 10, 10, 8)) == :MidPeak # Cooling weekday mid-peak
@test tou(DateTime(2012, 10, 10, 2)) == :OffPeak # Cooling weekday off-peak

@test tou(DateTime(2012, 1, 10, 9)) == :OnPeak # Heating weekday on-peak
@test tou(DateTime(2012, 1, 10, 12)) == :MidPeak# Heating weekday mid-peak
@test tou(DateTime(2012, 1, 10, 22)) == :OffPeak # Heating weekday off-peak

@test tou(DateTime(2012, 10, 13, 12)) == :OffPeak # Cooling weekend on-peak
@test tou(DateTime(2012, 10, 13, 8)) == :OffPeak # Cooling weekend mid-peak
@test tou(DateTime(2012, 10, 13, 2)) == :OffPeak # Cooling weekend off-peak

@test tou(DateTime(2012, 1, 14, 9)) == :OffPeak # Heating weekend on-peak
@test tou(DateTime(2012, 1, 14, 12)) == :OffPeak# Heating weekend mid-peak
@test tou(DateTime(2012, 1, 14, 22)) == :OffPeak # Heating weekend off-peak

@test tou(DateTime(2012, 7, 1, 12)) == :OffPeak # Cooling holiday on-peak
@test tou(DateTime(2012, 7, 1, 8)) == :OffPeak # Cooling holiday mid-peak
@test tou(DateTime(2012, 7, 1, 2)) == :OffPeak # Cooling holiday off-peak

@test tou(DateTime(2012, 2, 20, 9)) == :OffPeak # Heating holiday on-peak
@test tou(DateTime(2012, 2, 20, 12)) == :OffPeak# Heating holiday mid-peak
@test tou(DateTime(2012, 2, 20, 22)) == :OffPeak # Heating holiday off-peak
