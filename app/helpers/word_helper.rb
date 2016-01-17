module WordHelper

  def format_model_errors model
    alert = ""
    if model.errors
      errors = model.errors
      errors.keys.each do |field|

        alert += field.to_s
        alert += " <ul> "
        errors[field].each do |error|
          alert += " <li> "
          alert += error
          alert += " </li> "
        end
        alert +=  " </ul> "
      end
    end
    alert
  end
end


