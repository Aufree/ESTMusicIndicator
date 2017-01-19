Pod::Spec.new do |s|

  s.name         = "ESTMusicIndicator"
  s.version      = "0.1.3"
  s.summary      = "Cool Animated music indicator view written in Swift."

  s.description  = <<-DESC
					A view that mimics the music playback indicator in the Music.app on iOS 8.
                    It has three vertical bars and they oscillate randomly.
                   DESC

  s.homepage     = "https://github.com/Aufree/ESTMusicIndicator"
  s.screenshots  = "https://cloud.githubusercontent.com/assets/5310542/12050743/8b3352ec-af34-11e5-99b8-24577e5475e7.png"

  s.license      = "MIT"
  s.author             = { "Aufree" => "freedomlijinfa@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Aufree/ESTMusicIndicator.git", :tag => s.version }

  s.source_files  = "Classes/**/*.swift"
  s.frameworks = 'QuartzCore'
end
