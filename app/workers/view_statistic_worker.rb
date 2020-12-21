class ViewStatisticWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(medium_id)
    #call countview function*60*6

    redis = Redis.new
    redis.set(medium_id, id)
    #time redis expire
    if redis.expire(medium_id, 3*60*60)
      id = redis.get(medium_id)
      
      #find job in sidekiq
      scheduler = Sidekiq::ScheduledSet.new
      job = scheduler.select { |s| s.klass == 'ViewStatisticWorker' && s.id == id }.first
      #other way
      # Sidekiq::ScheduledSet.new.find_job(jid)

      #reset job
      entry = Sidekiq::SortedEntry.new(job.parent, job.score, job.item) if job.present?
      entry.reschedule(new_publish_time)

      #delete Job in redis in case of wanting
      job.delete
      redis.del(product_id)
    end
  end

  def countview
    #count view logic
    medium = medium.find(medium_id)
  end
end