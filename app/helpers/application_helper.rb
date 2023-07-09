module ApplicationHelper
    def check_process_status(process_names)
        running_processes = []
    
        process_names.each do |process_name|
          result = `tasklist /FI "IMAGENAME eq #{process_name}" /NH`
          running_processes << process_name if result.include?(process_name)
        end
    
        if running_processes.empty?
          "指定されたプロセスはいずれも実行されていません"
        else
          "以下のプロセスが実行中です: #{running_processes.join(', ')}"
        end
    end
end
