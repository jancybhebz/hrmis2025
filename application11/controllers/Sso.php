defined('BASEPATH') OR exit('No direct script access allowed');

require_once(APPPATH . 'third_party/php-saml/_toolkit_loader.php');

class Sso extends CI_Controller {

    public function login() {
        $settings = $this->get_saml_settings();
        $auth = new OneLogin\Saml2\Auth($settings);

        $auth->login(); // Redirects to ADFS for login
    }

    public function acs() {
        $settings = $this->get_saml_settings();
        $auth = new OneLogin\Saml2\Auth($settings);

        $auth->processResponse();

        if ($auth->isAuthenticated()) {
            $attributes = $auth->getAttributes();
            $userEmail = $auth->getNameId();

            // Set session or handle user authentication here
            $this->session->set_userdata('email', $userEmail);
            redirect('dashboard');
        } else {
            echo "SSO Authentication Failed.";
        }
    }

    private function get_saml_settings() {
        return [
            'sp' => [
                'entityId' => base_url('sso/metadata'),
                'assertionConsumerService' => [
                    'url' => base_url('sso/acs'),
                ],
                'singleLogoutService' => [
                    'url' => base_url('sso/logout'),
                ],
            ],
            'idp' => [
                'entityId' => 'https://auth.paete.gov.ph/adfs/services/trust',
                'singleSignOnService' => [
                    'url' => 'https://auth.paete.gov.ph/adfs/ls',
                ],
                'x509cert' => 'MIIE3jCCAsagAwIBAgIQVoEMUxt/nYFOmDE1y5LfYjANBgkqhkiG9w0BAQsFADArMSkwJwYDVQQDEyBBREZTIFNpZ25pbmcgLSBhdXRoLnBhZXRlLmdvdi5waDAeFw0yNTAxMjYyMzI2NDVaFw0yNjAxMjYyMzI2NDVaMCsxKTAnBgNVBAMTIEFERlMgU2lnbmluZyAtIGF1dGgucGFldGUuZ292LnBoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwMBJOWlFciZ84/mLJQ8rEuT/B9s8FbvY4m3LYV6ca6aZQ7GI1joXdVCle7IZNkTTlekqQGWccOfUctkoPFWOl1hwgnm6G0M8eiPJStlIN18cRqdMUXG/3TiXaFy3ktWQq3YD1+oXacfpAPTQ//Jkx7/k6mXpTIGfdQkyn27dpY79WBnS3GnyPP+EZmnRKPWdNbdPSI9K+zPqR8hJhnSoDZ3rGNQekgWtq6Vtb7ScJUOUF9rruFteKO6eJkmxiuLKBfO77EbAs9aPvcl2qZfAzV78b5sHScK1UCsr2VAM1Lf04SmcdOx6VTwXt1VTbCNKvayj/16A3493aHPzGgIQwgzLKTuVtFREMwoTOT9BvE8HxcdaprMk7uZ5d1XiZaa4N4ENbKtsdL6MrfNFxjOXjyOOAdWH3U5bJwSJOuPq2nHTtLz3HfZ/a9ih2sTM36XfBKLnoJlzSylHAJ654yfkFaQCFAdQIuelXOgLyY5fdfDQ+ElBcwUgTv4V0+mzGWHZ4rx7wfigmJWhmF+IwMx2TGIIPcW0mXFQCx8ttAEDOai5SrDRhkvvdm63nKTRlWUladXCW1aK8n/I1Jn8QNm2sKdrcL3r+7rs4LoEQMXelAqI821nmfbQajDp1EViLZ2VBQnbcuWItkAz9TNcCtTSxNMlGK1VpFBkzqtOD4ieh3kCAwEAATANBgkqhkiG9w0BAQsFAAOCAgEAMQ9AveLboICy8gSAjZN5ojOlUDQWusxu0U5FCqbMx6n20Bjysa2vEFvhOMwOWAEw8+QYMZm+HIw6m7BkWBTS/hjOFLBLBFJ5gGrirfdn+1oVNyoYjh9ym5BdQS3FTRI92yr2cdeG/wKYXR8l57S77mO0GSDq4sT4UoorF8q5CEEv3VbtxtG3wXgzB5FStY3ayZjKMxGrsPlPEgIBe80HYXQ7IucTzjvioLWoGL+zPE++/WLgbizztEib1OuiqESg2mgwvD1pOgN+YaAoNbMnGc66MQrRR3HKDQXXpRdG98/e5yVQZa/utnS8ku1nrMCt7LkZV32TmSdWgi9eGOb0Q390WNr580fdBAmOptrdw7eKGHscxf5KNjSGpybTYEKL7HSvp/8adldX6B2GosNEB2szED2EZtMbqtA0Le/vHdi8FPOSWUnszYMCzhqPAiYm8Cfz3zP5wb/u+T8gK0cWvZB6PjFsWInSwTVgFAvi3fposFdFpVT4QKf4UsHmX2v6hijtPP2KNpwXj8P7OthrWjvb/yRdwBCi9wIk2BToq3n/Jm4uJQrjNrs5zDjEh7z2icC6uB/XXxjJBfBYwpNPec8yZcgf/y2EBMMpFGDXB/MMak/Gp55A01LVWBy4WULKfYBO3uP9ZE5lY5xY8bgkwzHddBtwPRiBsiOMLrLz6yQ=',
            ],
        ];
    }

	public function metadata() {
    $settings = $this->get_saml_settings();
    
    $samlSettings = new OneLogin\Saml2\Settings($settings, true);
    $metadata = $samlSettings->getSPMetadata();
    
    // Validate the generated metadata XML
    $errors = $samlSettings->validateMetadata($metadata);
    if (!empty($errors)) {
        echo "Invalid SAML Metadata: " . implode(', ', $errors);
        return;
    }

    // Set appropriate content-type for XML
    header('Content-Type: text/xml');
    echo $metadata;
	}
}
