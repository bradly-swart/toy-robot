module Messages
  def self.messages
    @messages = {
                 welcome: '**[Welcome to ToyRobot]**',
                 instructions: 'Robot is waiting for commands:[PLACE X,Y,F; REPORT; LEFT; RIGHT; MOVE; QUIT]',
                 quit: 'Thanks for playing!',
                 invalid_input: 'invalid input:%'
                }
  end

  def self.display(message, var = '')
    message = self.messages[message].gsub("%", var)
    p message
  end
end
