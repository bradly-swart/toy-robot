module Messages
  def self.messages
    @messages = {
                 welcome: '**[Welcome to ToyRobot]**',
                 instructions: 'Robot is waiting for commands:[PLACE X,Y,F; REPORT; LEFT; RIGHT; MOVE; QUIT]\n Example: place 1,2,north',
                 quit: 'Thanks for playing!',
                 invalid_input: 'invalid input:%',
                 input_error: "Sorry, I couldn't understand you :(",
                 successful_placement: 'Robot placed',
                 invalid_placement: 'invalid placement coordinates',
                 robot_not_placed: 'robot not yet placed, please issue a place command',
                 robot_placement: 'Trying to place robot'
                }
  end

  def self.display(message, var = '')
    message = self.messages[message].gsub("%", var)
    p message
  end
end
