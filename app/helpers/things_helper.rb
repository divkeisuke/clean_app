module ThingsHelper
    def hokori_parameter(clean_progress_day,clean_frequency)
        if @clean_progress_day.to_i < @thing.clean_frequency * 1/3
            "キレイ！！"
        elsif @clean_progress_day.to_i >= @thing.clean_frequency * 1/3 && @clean_progress_day <= @thing.clean_frequency * 2/3
            "普通"
        elsif @clean_progress_day.to_i > @thing.clean_frequency * 2/3 && @clean_progress_day.to_i < @thing.clean_frequency
            "汚い"
        else
            "要掃除"
        end
    end
end
