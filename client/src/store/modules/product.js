export default {
    //данные
    state: {
        products: [], //массив продуктов
    },

    //принимаем данные
    actions: {
        //вывод продуктов / по категории
        async GET_PRODUCTS_FROM_API({commit}, category) {
            try {
                //запрос на сервер
                const res = await fetch('http://store/public/api/product' + (category ? '/' + category : ''), {
                    method: 'get',
                })

                //принимаем данные с сервера
                const products = await res.json()

                //записываем данные в хранилище
                commit('SET_PRODUCTS_TO_STATE', products.data)
            }

            //если запрос не сработал выводим ошиибки в консоль
            catch (err) {
                console.log(err);
            }
        },
    },

    //изменяем данные
    mutations: {
        //метод для записи массива продуктов
        SET_PRODUCTS_TO_STATE(state, products) {
            state.products = products
        },

        //метод для сортировки продуктов
        SORT_PRODUCTS(state, selectedSort) {
            //сортировка по популярности
            if (selectedSort === "Популярные")
                state.products.sort((a, b) => +a.rate > +b.rate ? -1 : 1)

            //сортировка по цене
            if (selectedSort === "От дорогих к дешевым")
                state.products.sort((a, b) => +a.price > +b.price ? -1 : 1)
            if (selectedSort === "От дешевых к дорогим")
                state.products.sort((a, b) => +a.price > +b.price ? 1 : -1)
        },
    },

    //обновляем и выводим данные
    getters: {
        //обновляет и возвращает список продуктов
        PRODUCTS(state) {
            return state.products
        },

        //обновляет и возвращает количество продуктов
        PRODUCTS_COUNT(state) {
            return state.products.length
        }
    }
}