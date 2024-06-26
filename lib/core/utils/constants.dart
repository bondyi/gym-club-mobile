const baseUrl = '192.168.100.4:58316';

const spFirstTimerKey = 'first_timer';

const registerUserEndpoint = '/api/Auth/register';
const loginUserEndpoint = '/api/Auth/login';
const refreshTokensEndpoint = '/api/Auth/refresh';

const usersEndpoint = '/api/Users';

const requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

const spAccessTokenKey = 'accessToken';
const spRefreshTokenKey = 'refreshToken';
