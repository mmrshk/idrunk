module ApplicationRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: :application do
        root to: 'home#index'
      end
    end
  end
end
