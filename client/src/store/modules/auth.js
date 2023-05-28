export default {
    //данные
    state: {
        token: localStorage.getItem('token') ? localStorage.getItem('token') : null, //токен авторизации
        role: localStorage.getItem('role') ? localStorage.getItem('role') : null, //роль пользователя
        user: { //информация авторизированного пользователя
            'id': '',
            'name': '',
            'surname': '',
            'patronymic': '',
            'telephone': 0,
            'login': '',
            'group': '',
            'photo': '',
        },
        validationError: {
            'login': '',
            'password': '',
            'auth': '',
        },
    },

    //принимаем данные
    actions: {
        //функция авторизации
        async onLogin({commit}, [login, password]) {
            try {
                //запрос на сервер
                const res = await fetch('http://store/public/api/login', {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        login: login,
                        password: password,
                    })
                })

                //принимаем данные с сервера
                const auth = await res.json()

                //записываем данные в хранилище
                if (auth.data) {
                    commit('SET_VALIDATION_ERROR_AUTH', '')
                    commit('SET_VALIDATION_ERROR_INPUT', [])
                    commit('SET_TOKEN', auth.data.user_token)
                }

                if (auth.error) {
                    commit('SET_VALIDATION_ERROR_AUTH', 'Проверте поля ввода!')
                    commit('SET_VALIDATION_ERROR_INPUT', auth.error.errors)
                }
            }

            //если запрос не сработал выводим ошиибки в консоль
            catch (err) {
                console.log(err);
                commit('SET_VALIDATION_ERROR_INPUT', [])
                commit('SET_VALIDATION_ERROR_AUTH', 'Не верный логин или пароль!')
            }
        },

        //функция выхода из учетной записи
        async onLogout({state, commit}) {
            try {
                //запрос на сервер
                await fetch('http://store/public/api/logout', {
                    method: 'post',
                    headers: {
                        'Authorization': 'Bearer ' + state.token,
                    }
                })

                //записываем данные в хранилище
                commit('DEL_TOKEN')
                commit('DEL_ROLE')
                commit('SET_USER', null)
            }

            //если запрос не сработал выводим ошиибки в консоль
            catch (err) {
                console.log(err);
            }
        },

        //вывод информации о пользователе
        async GET_USERINFO_FROM_API({state, commit}) {
            try {
                //запрос на сервер
                const res = await fetch('http://store/public/api/info', {
                    method: 'get',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + state.token,
                    },
                })

                const user = await res.json()
                //записываем данные в хранилище
                commit('SET_USER', user.data[0])
                commit('SET_ROLE', user.data[0].role)
            }

            //если запрос не сработал выводим ошиибки в консоль
            catch (err) {
                console.log(err);
            }
        },
    },

    //изменяем данные
    mutations: {
        //метод для записи токена
        SET_TOKEN(state, token) {
            state.token = token
            localStorage.setItem('token', token)
        },

        //метод для записи роли авторезированного пользователя
        SET_ROLE(state, role) {
            state.role = role
            localStorage.setItem('role', role)
        },

        //метод для записи токена
        DEL_ROLE(state) {
            state.role = null
            localStorage.removeItem('role')
        },

        //метод для удаления токена
        DEL_TOKEN(state) {
            state.token = null
            localStorage.removeItem('token')
        },

        //метод для записи информации авторизированного пользователя
        SET_USER(state, user) {
            state.user.photo = 'http://store/storage/app/public/images/users/'
            state.user = {
                'id': user.id,
                'name': user.name,
                'surname': user.surname,
                'patronymic': user.patronymic ? user.patronymic : '',
                'telephone': user.telephone,
                'login': user.login,
                'group': user.group,
                'photo': state.user.photo + (user.photo ? user.photo : 'default.png'),
            }
        },

        SET_VALIDATION_ERROR_INPUT(state, errors) {
            state.validationError.login = errors.login ? errors.login[0] : '';
            state.validationError.password = errors.password ? errors.password[0] : '';
        },

        SET_VALIDATION_ERROR_AUTH(state, error) {
            state.validationError.auth = error;
        }
    },

    //обновляем и выводим данные
    getters: {
        //обновляет и возвращает токен авторизвции
        TOKEN: state => state.token,
        //обновляет и возвращает роль авторизированного пользователя
        ROLE: state => state.role,
        //обновляет и возвращает информацию авторизованного пользователя
        USER: state => state.user,
        //обновляет и возвращает ошибки валидации полей
        VALIDATION_ERROR_AUTH: state => state.validationError,
        //возвращает true если пользователь авторизирован
        IS_AUTH: state => !!state.token,
    }
}