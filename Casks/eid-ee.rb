cask 'eid-ee' do
  version '19.7.0.1834'
  sha256 '36b6a39e1c6fe3d94a7ac42e08c28ce058cf9eebe5db9f1c42a14684c37215e6'

  url "https://installer.id.ee/media/osx/Open-EID_#{version}.dmg"
  name 'Electronic identity card software for Estonia'
  name 'eID Estonia'
  homepage 'https://installer.id.ee/?lang=eng'

  pkg 'Open-EID.pkg'

  uninstall script: {
                      executable: 'uninstall.sh',
                      input:      ['y'],
                      sudo:       true,
                    },
            quit:   'ee.ria.TokenSigningApp'

  caveats <<~EOS
    DigiDoc4 Client and ID-card Utility are available in the App Store:
      https://appstore.com/mac/ria
  EOS
end
