module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the new current_survey page/
      new_current_survey_path


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the surveys index$/i
      surveys_path

    when /^the survey page for "([^\"]*)"$/i
      survey_path(Survey.find_by_name($1))

    when /^the survey start page for "([^\"]*)"$/i
      administer_survey_path(Survey.find_by_name($1))

    when /^the question page for "([^\"]*)" in survey "([^\"]*)"$/i
      edit_survey_question_path(Survey.find_by_name($2),Question.find_by_name($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
