class CourseReviewsController < ApplicationController
    def new
        @course = Course.find_by_slug(params[:slug])
        @course_review = CourseReview.new
    end
    
    def create 
       p params
       course_id = params["course_id"]
       text = params["course_review"]
       rating = params['rating']
       params = { :course_id => course_id,
                  :user_id => current_user.id,
                  :text => text["text"],
                  :rating => rating[course_id]
       }
       course = CourseReview.new(params)
       course.save
       redirect_to root_path
       flash[:success] = "Your review has been saved!"
       
    end
end