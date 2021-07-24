module ApplicationHelper
    #Add bootstrap flash messages
    def select_alert_type(input)
        case input
        when 'notice'
            return 'info'
        when 'success'
            return 'success'
        when 'error'
            return 'danger'
        when 'warning'
            return 'warning'
        else 
            return 'warning'
        end
    end
end
