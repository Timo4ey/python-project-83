PGDMP  	        7        
        {            database #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16421    database    DATABASE     ]   CREATE DATABASE database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE database;
                postgres    false            �            1259    16428 
   url_checks    TABLE       CREATE TABLE public.url_checks (
    id bigint NOT NULL,
    url_id bigint,
    status_code integer,
    h1 character varying(255),
    title character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL
);
    DROP TABLE public.url_checks;
       public         heap    postgres    false            �            1259    16433    url_checks_id_seq    SEQUENCE     �   ALTER TABLE public.url_checks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.url_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    16423    urls    TABLE     �   CREATE TABLE public.urls (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL
);
    DROP TABLE public.urls;
       public         heap    postgres    false            �            1259    16422    urls_id_seq    SEQUENCE     �   ALTER TABLE public.urls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210                      0    16428 
   url_checks 
   TABLE DATA           a   COPY public.url_checks (id, url_id, status_code, h1, title, description, created_at) FROM stdin;
    public          postgres    false    211                    0    16423    urls 
   TABLE DATA           4   COPY public.urls (id, name, created_at) FROM stdin;
    public          postgres    false    210   �       &           0    0    url_checks_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.url_checks_id_seq', 7, true);
          public          postgres    false    212            '           0    0    urls_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.urls_id_seq', 3, true);
          public          postgres    false    209            �           2606    16435    url_checks url_checks_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.url_checks
    ADD CONSTRAINT url_checks_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.url_checks DROP CONSTRAINT url_checks_pkey;
       public            postgres    false    211            �           2606    16427    urls urls_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_pkey;
       public            postgres    false    210            �           2606    16436 !   url_checks url_checks_url_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.url_checks
    ADD CONSTRAINT url_checks_url_id_fkey FOREIGN KEY (url_id) REFERENCES public.urls(id);
 K   ALTER TABLE ONLY public.url_checks DROP CONSTRAINT url_checks_url_id_fkey;
       public          postgres    false    211    3213    210               �  x���N1�ϻO1V�7�ܪ�P����˒���(٤�U�@��c�z�ДHx��$�<�
�Hd�������ׁ8��;����K}��z�`���!�k����}�g��F�
�ϭ����ov���}D6��ᵫƄ�;a���#���:��Ge���z�/�RM�~m�>�8�`C2��_�# =��=��6�i�xN�>��t����gM���Ϡ�8���|d�4<{��)k�˺�u�]-�h��m*Y�崓b�j�@��k]l�$g]Y�幓��Y0���	4��ҍ-�>��ą���ц�8���2���! �r�f����������i^��.+�I��T{ �����L@;+�=|��0Z���� ,EK%?��(����rY����o�4r����[\��<S�3Oa�����4UCe5�Ab}�V�	�Q]�Mi�ֺTQW[vT�RuҬ�$��
zJ�u�DeS��ڨ��G/�"���h����VKI�VI4��Ki;SxVi��Vm��Z�ާM�=�C�D�������M��R���RU��3�s#��^��Z��BX�9�󹗠,��u�()��;�K��� �d~����^��b��.���N/�� ?� N��y� ���������=�u��Б         r   x�m�A�0�5s
/�0�SJ�Y�l,��Hk��w�F��K�m5����96^Kg�h/���`��#�©#s���޹�_�C�� =��,��3_����'Z	 ����љ���")]     