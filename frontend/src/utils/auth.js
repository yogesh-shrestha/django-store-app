export function getTokenDuration() {
    const storedExpirationDate = localStorage.getItem('demoShopExpirationDate')
    const expirationDate = new Date(storedExpirationDate)
    const currentDate = new Date();
    const duration = expirationDate.getTime() - currentDate.getTime();
    return duration;
}

export function getAuthToken() {
    const token = localStorage.getItem('demoShopAccesstoken')
    const tokenDuration = getTokenDuration();
    if (tokenDuration < 0) {
        if (localStorage.getItem('demoShopAccesstoken')) {
            localStorage.removeItem('demoShopAccesstoken');
            localStorage.removeItem('demoShopRefreshtoken');
            localStorage.removeItem('demoShopExpirationDate');
        }       
        return null
    }
    return token;
}

export function tokenLoader() {
    return getAuthToken()
}