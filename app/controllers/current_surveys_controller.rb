class CurrentSurveysController < ApplicationController
   def administer
     @survey = Survey.find(params[:id])
   end
end