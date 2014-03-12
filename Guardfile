# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :input => 'src', :output => 'lib', :bare => true, :all_on_start => true, :hide_success => true

guard 'shell' do
  watch '.*\.coffee' do |m|
    `gulp`
  end
end

