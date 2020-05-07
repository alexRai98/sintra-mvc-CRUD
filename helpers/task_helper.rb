module TaskHelper
    def task_complete_url(task)
        "/tasks/#{task.id}/#{task.stade ? "uncomplete" : "complete"}"
    end
    def task_delete(task)
        "/tasks/#{task.id}"
    end
end